from flask import Flask
from flask import request
import os
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

@app.route("/ifttt", methods=["POST"])
def handler():
    username = request.get_data()
    username = username.decode("utf-8")
    command = "youtube-dl -o '/mnt/hgfs/streams/" + username + "/%(title)s.%(ext)s' twitch.tv/" + username
    screened_command = "screen -dmS " + username + " " + command
    os.system(screened_command)
    print(username)
    return "ok ty" # needed so that flask doesn't throw an error for not being able to return a web page

if __name__ == "__main__":
    app.run()

# ./ngrok http 5000