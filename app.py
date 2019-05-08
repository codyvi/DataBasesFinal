from flask import Flask, render_template, request
import logging
import sys

import db

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

# example!
@app.route('/students', methods=['GET', 'POST'])
def students():
    def db_query():
        _db = db.Database()
        if request.method == "POST":
            sID = request.form["sID"]
            sUPRC = request.form["sUPRC"]
            sName = request.form["sName"]
            sAddress = request.form["sAddress"]
            sPhoneNumber = request.form["sPhoneNumber"]
            sSex = request.form["sSex"]
            sBDate = request.form["sBDate"]
            sDepartment = request.form["sDepartment"]
            sMajor = request.form["sMajor"]
            _db.insert_student(sID, sUPRC, sName, sAddress, sPhoneNumber, sSex, sBDate, sDepartment, sMajor)
            print('Student inserted', file=sys.stdout)
            
            studs = _db.list_students()
            print('Listing all the students', file=sys.stdout)

            return studs

        else:
            if request.method == "GET":
                student_id = request.values.get('sID', '')
                studs = _db.list_student(student_id)
                print('Listing student given info ' + student_id , file=sys.stdout)
                return studs

    res = db_query()

    return render_template('students.html', result=res, content_type='application/json')

@app.route('/professor', methods=['GET', 'POST'])
def professor():
    def db_query():
        _db = db.Database()
        if request.method == "POST":
            pID = request.form["pID"]
            pUPRC = request.form["pUPRC"]
            pName = request.form["pName"]
            pAddress = request.form["pAddress"]
            pPhoneNumber = request.form["pPhoneNumber"]
            pSex = request.form["pSex"]
            pBDate = request.form["pBDate"]
            _db.insert_professor(pID, pUPRC, pName, pAddress, pPhoneNumber, pSex, pBDate)
            print('Professor inserted', file=sys.stdout)

            profs = _db.list_professors()
            print('Listing all the professors', file=sys.stdout)

            return profs

        else:
            if request.method == "GET":
                professor_id = request.values.get('pID', '')
                profs = _db.list_professor(professor_id)
                print('Listing professor given info ' + professor_id , file=sys.stdout)
                return profs

    res = db_query()

    return render_template('professor.html', result=res, content_type='application/json')

