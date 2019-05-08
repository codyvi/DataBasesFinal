/*
    Tec Database 
    Creators:
    David A. Cantú Martínez 	A00822455
    Adrián García López 	    A01351166 
    Paola A. Villarreal García 	A00821971
    Luis Adrian Gartner López   A00227224
*/

--First line to create the database 
CREATE Database TecUniversity;
--Creating Tables 
    CREATE TABLE Department(
        dId varchar(20) Not Null,
        dName varchar (50) Not Null,
        dNumber varchar(5) Not Null,
        dPhoneNumber varchar(20) Not Null,
        dOffice varchar(20) Not Null,
        primary key(dId)
    )Engine=InnoDB;

    CREATE TABLE Students(
        sID varchar(20) Not Null,
        sUPRC varchar(20) NOT Null, --UPRC == CURP
        sName varchar(25) Not Null,
        sAddress varchar(25)  Null, 
        sPhoneNumber varchar (20) Null, 
        sSex varchar (1) Null,  
        sBDate datetime(6) Null, 
        sDepartment varchar(20) Not Null, 
        sMajor varchar(20) Not Null,
        primary key(sID, sUPRC), 
        foreign key(sDepartment) references Department(dId)
    )Engine=InnoDB;

    CREATE TABLE Schedule(
        hId varchar(25) Not Null,
        hTime datetime(6) Not Null,
        primary key(hId)
    )Engine=InnoDB;

    CREATE TABLE Professor(
        pID varchar(20) Not Null,
        pUPRC varchar(20) NOT Null, --UPRC == CURP
        pName varchar(25) Not Null,
        pAddress varchar(25)  Null, 
        pPhoneNumber varchar (20) Null, 
        pSex varchar (1) Null,  
        pBDate datetime(6) Null, 
        primary key(pID)
    )Engine=InnoDB; 

    CREATE TABLE ProfessorSchedule(
        pID varchar(20) Not Null,
        hId varchar(25) Not Null,
        primary key(pId, hId), 
        foreign key (pID) references Professor(pId),
        foreign key (hId) references Schedule(hId)
    )Engine=InnoDB;

    CREATE TABLE Course(
        cNumber varchar(20) Not Null,
        cName varchar(25) Not Null,
        cDescription varchar(25) Not Null, 
        cHours datetime(6) Not Null,
        dId varchar(20) Not Null,
        primary key(cNumber),
        foreign key(dId) references Department(dId)
    )Engine=InnoDB;

    CREATE TABLE Groupp(
        gId varchar(20) Not Null,
        gNumber varchar(20) Not Null,
        pID varchar(20) Not Null,
        cNumber varchar(20) Not Null,
        gEcoa varchar(20) Not Null, 
        gUPRC varchar(20) Not Null,
        gYear datetime(6) Not Null,
        gSemester varchar(20) Not Null,
        primary key(gNumber, gId, gUPRC),
        foreign key(pId) references Professor(pId),
        foreign key(cNumber) references Course(cNumber) 
    )Engine=InnoDB;

    create table TakeCourse(
        tcID varchar(20) Not Null,
        tcUPRC varchar(20) Not Null,
        tcGroupNumber varchar(5) Not Null,
        tcCourseNumber varchar(5) Not Null,
        tcGrade varchar(2) Not Null,
        tcHistory varchar(25) Not Null,
        primary key(tcID),
        foreign key(tcCourseNumber) references Course(cNumber),
        foreign key(tcGroupNumber) references Groupp(gNumber)
    )Engine=InnoDB;

--Inserts 

--Department
Insert Into Department values('4521', 'Computer Department', '1','8110236541','100');
Insert Into Department values('4522', 'Chemistry Department', '2','8110236361','200');
Insert Into Department values('4523', 'Electronic Department', '3','8110236251','300');
Insert Into Department values('4524', 'Physics Department', '4','8110236861','400');

--Students
Insert Into Students values('6231', 'CAMD000421HNLRV4','David Alonso Cantú', 'Cumbres', '8115822516', 'M','2000-04-21','4521','Computer Science');
Insert Into Students values('6232', 'VAGP990301HNLRF3','Paco Antonio Vargas', 'San Pedro', '8112369547', 'M','1999-06-02','4522','Chemical Engineer');
Insert Into Students values('6233', 'ELTK980401HNLRG6','Elvis Tek', 'Santa Catarina', '8110523698', 'M','1989-04-18','4523','Robotics');
Insert Into Students values('6234', 'MPLO950204HNLRT4','María Perez', 'Apodaca', '8110236984', 'F','1995-02-04','4524','Physics');

--Schedule
Insert Into Schedule values('1', '0000-00-00 07:30:00.000000');
Insert Into Schedule values('2', '0000-00-00 08:30:00.000000');
Insert Into Schedule values('3', '0000-00-00 09:30:00.000000');
Insert Into Schedule values('4', '0000-00-00 10:30:00.000000');
Insert Into Schedule values('5', '0000-00-00 12:30:00.000000');

--Profesor 
Insert Into Professor values('4578', 'PEPP541016HASCIP07', 'Pepe Pecas', 'Por aquí', '4619293210', 'M', '1954-10-16');
Insert Into Professor values('4579', 'ELPLA541016HASCP07', 'Elba Lazo', 'Por ahí', '8271029291', 'F', '1988-10-16');
Insert Into Professor values('4580', 'PER4541016HASCIP07', 'Pepe Roni', 'Por allá', '8372918539', 'M', '1990-10-16');
Insert Into Professor values('4581', 'ELPU541016HASCIP07', 'Elsa Pato', 'Por acuyá', '75831983829', 'F', '1970-10-16');
Insert Into Professor values('4582', 'PEPLA54101HASCIP07', 'Pepe Lotas', 'Hasta Cumbres...', '9381927492', 'M', '1989-10-16');
--ProfessorSchedule
Insert Into ProfessorSchedule values('4578', '1');
Insert Into ProfessorSchedule values('4579', '2');
Insert Into ProfessorSchedule values('4580', '3');
Insert Into ProfessorSchedule values('4581', '4');
Insert Into ProfessorSchedule values('4582', '5');
--Course
Insert Into Course values('50', 'Sepultura de Vatos', 'Creación y utilización de Estructura de datos', '0000-00-00 07:30:00.000000', '4521');
Insert Into Course values('51', 'Huevassign', 'Resolucion de problemas en plataforma', '0000-00-00 10:30:00.000000', '4522');
Insert Into Course values('52', 'Algorritmos', 'Analisis y diseño de Algirritmos', '0000-00-00 08:30:00.000000', '4523');
Insert Into Course values('53', 'Bases de Gatos', 'Acariciar Gatitos', '0000-00-00 07:30:00.000000', '4523');
Insert Into Course values('54', 'Sepultura de Vatos', 'Creación y utilización de Estructura de datos', '0000-00-00 07:30:00.000000', '4524');
--Group
Insert Into Groupp values('200', '300', '4578', '50', '100', 'PEPP541016HASCIP07', '0000-00-00 07:30:00.000000', '4');
Insert Into Groupp values('201', '301', '4579', '51', '100', 'ELPLA541016HASCP07', '0000-00-00 07:30:00.000000', '5');
Insert Into Groupp values('202', '302', '4580', '52', '100', 'PER4541016HASCIP07', '0000-00-00 07:30:00.000000', '3');
Insert Into Groupp values('203', '303', '4581', '53', '100', 'ELPU541016HASCIP07', '0000-00-00 07:30:00.000000', '4');
Insert Into Groupp values('204', '304', '4582', '53', '100', 'PEPLA54101HASCIP07', '0000-00-00 07:30:00.000000', '6');
--TakeCourse
Insert Into TakeCourse values('50000', 'ASDLADDHJ1H5646DF5', '300', '50', '10', 'Aqui no se que va equis de');
Insert Into TakeCourse values('50001', 'ASD8F99A8S8DSAH8DF', '301', '51', '9', 'Aqui no se que va equis de');
Insert Into TakeCourse values('50002', 'LKJ2KLJ34JK2L3K344', '302', '52', '8', 'Aqui no se que va equis de');
Insert Into TakeCourse values('50003', 'JH0JD9FG9SFGSD0FG9', '303', '53', '7', 'Aqui no se que va equis de');
Insert Into TakeCourse values('50004', 'LKJ45J6KJ45HK6HK45', '304', '54', '6', 'Aqui no se que va equis de');