#!flask/bin/python
# coding=utf-8
from flask import render_template
from flask import Flask
import ansible.playbook
from ansible import callbacks
from ansible import utils
import json

app = Flask(__name__)

def runplaybook(path):
    if not path.strip():
        return
    stats = callbacks.AggregateStats()
    playbook_cb = callbacks.PlaybookCallbacks(verbose=utils.VERBOSITY)
    runner_cb = callbacks.PlaybookRunnerCallbacks(stats,verbose=utils.VERBOSITY)
    res=ansible.playbook.PlayBook(
                playbook=path,
                stats=stats,
                callbacks=playbook_cb,
                runner_callbacks=runner_cb
        ).run()
    data = json.dumps(res,indent=4)
    return data
    

@app.route('/')
def hello():
    return render_template('hello.html')

@app.route('/api/svn/update/<repo>')
def test_post(repo):
    if repo == 'test':
        playbook='/opt/ansible/playbook/update_cody.yml'
    else:
        return 'not found this repo'
    return runplaybook(playbook)
    #return 'Repo %s' % repo

if __name__ == '__main__':
    app.run(host='0.0.0.0')

