import os
import subprocess

def create_user(self, username):
	proc = subprocess.Popen(['sudo','useradd', '-m', username, '-g', 'ftpaccess', '-s', '/usr/sbin/nologin'])