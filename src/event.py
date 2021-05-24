from flask import Flask, render_template, request, session
import pymysql

from werkzeug.utils import secure_filename

con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
cmd = con.cursor()

app = Flask(__name__)
app.secret_key='abc'

@app.route('/login')
def login():
    return render_template('LOGIN.html')

@app.route('/logout')
def logout():
    session.clear()
    return render_template('home.html')


@app.route('/logincode', methods=['post'])
def logincode():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    name = request.form['textfield']
    passward = request.form['password']
    cmd.execute("SELECT * FROM login WHERE username= '"+name+"' and  password='"+passward+"'")
    result = cmd.fetchone()
    if result is None:
         return '''<script>alert("INVALID USERNAME OR PASSWORD");window.location='/'</script>'''
    else:
         lid = result[0]
         session['lid'] = lid
         type = result[3]
         if type == 'admin':
            return render_template('homea.html')
         elif type == 'student':
            return render_template('homes.html')
         else:
            return '''<script> alert("Invalid Id or Password");window.location='/' </script>'''








@app.route('/')
def home():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    return render_template('home.html')


@app.route('/vieweprofile')
def vieweprofile():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      comid =session['lid']
      cmd.execute("select * from student where lid='" + str(comid) + "'")
      result = cmd.fetchone()
      return render_template('Student Profile.html', value=result)

    else:
      return render_template('login.html')





@app.route('/event')
def event():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    return render_template('event.html')

@app.route('/viewevent')
def viewevent():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    cmd.execute("SELECT * FROM EVENT")
    result = cmd.fetchall()
    return render_template('event.html', value=result)

@app.route('/evlist')
def evlist():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      lid = session['lid']
      cmd.execute("SELECT * FROM EVENT WHERE eid  NOT IN(SELECT eid FROM ereg WHERE lid='" + str(lid) + "')  ")
      result = cmd.fetchall()
      return render_template('event list.html', value=result)
    else:
      return render_template('login.html')


@app.route('/evntreg')
def evntreg():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      comid = request.args.get('id')
      session['eid'] = comid
      cmd.execute("select * from event where eid='" + str(comid) + "'")
      result = cmd.fetchone()
      return render_template('event red std.html', value=result)
    else:
      return render_template('login.html')

@app.route('/ereg', methods=['post'])
def ereg():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      lid = session['lid']
      eid = session['eid']
      cmd.execute("insert into ereg values('" + str(eid) + "','" + str(lid) + "',CURDATE())")
      con.commit()
      return '''<script>alert("SUCCESS");window.location='/sthome'</script>'''
    else:
      return render_template('login.html')



@app.route('/reg')
def reg():
      return render_template('student registration.html')


@app.route('/regstudent', methods=['post'])
def regstudent():
      name = request.form['textfield']
      dob = request.form['date']
      email = request.form['textfield1']
      department = request.form['cars']
      password = request.form['textfield2']
      cmd.execute("insert into login values(null, '" + email + "' ,'" + password + "','student')")
      id = con.insert_id()
      cmd.execute("insert into student values('" + str(id) + "','" + name + "','" + dob + "','" + department + "','" + email + "')")
      con.commit()
      return '''<script>alert("SUCCESS");window.location='/'</script>'''


@app.route('/adhome')
def adhome():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      return render_template('homea.html')
    else:
      return render_template('login.html')
@app.route('/sthome')
def sthome():
    if 'lid' in session:
      con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
      cmd = con.cursor()
      return render_template('homes.html')
    else:
      return render_template('login.html')

@app.route('/eadd')
def eadd():
    if 'lid' in session:
      con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
      cmd = con.cursor()
      return render_template('event add.html')
    else:
      return render_template('login.html')

@app.route('/reglist')
def reglist():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      cmd.execute("SELECT ename,eid FROM EVENT WHERE eid  IN(SELECT eid FROM ereg )")
      result = cmd.fetchall()
      return render_template('reglist.html', value=result)
    else:
      return render_template('login.html')

@app.route('/regdel')
def regdel():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='event')
    cmd = con.cursor()
    if 'lid' in session:
      comid = request.args.get('id')
      session['eid'] = comid
      cmd.execute("SELECT student.* ,ereg.regdate FROM student JOIN ereg ON student.lid=ereg.lid WHERE ereg.eid='" + str(comid) + "'")
      result = cmd.fetchall()
      return render_template('regdel.html', value=result)
    else:
        return render_template('login.html')
@app.route('/addevent', methods=['post'])
def addevent():
    if 'lid' in session:
      name = request.form['textfield']
      max  = request.form['textfield2']
      date = request.form['date']
      VENUE = request.form['textfield3']
      lastdate = request.form['ldate']
      DECRIPTION = request.form['textfield4']
      cmd.execute("insert into EVENT values(null,'" + name + "' ,'" + date + "','" + max + "','" + VENUE + "','" + lastdate+ "','" + DECRIPTION + "')")
      con.commit()
      return '''<script>alert("SUCCESS");window.location='/adhome'</script>'''
    else:
        return render_template('login.html')









if __name__ == '__main__':
    app.run(debug=True)
