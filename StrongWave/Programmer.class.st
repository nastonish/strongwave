"
Programmer - підклас класу Employee, представляє працівника, якому платять за кількість фактично відпрацьованих годин.
Цей клас містить: гетери та сетери для actualHours, перевизначений метод weeklySalary, конструктор для створення програмістів.
"
Class {
	#name : 'Programmer',
	#superclass : 'Employee',
	#instVars : [
		'actualHours'
	],
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'instance creation' }
Programmer class >> lastName: aLastName
experience: years
hourlyRate: rate
minHours: minHours
actualHours: actualH [
    ^ self new
        lastName: aLastName;
        experienceYears: years;
        hourlyRate: rate;
        minWeeklyHours: minHours;
        actualHours: actualH;
        yourself.

]

{ #category : 'accessing' }
Programmer >> actualHours [
    ^ actualHours

]

{ #category : 'accessing' }
Programmer >> actualHours: aNumber [
    actualHours := aNumber

]

{ #category : 'printing' }
Programmer >> printOn: aStream [
    aStream
        nextPutAll: 'Programmer(';
        nextPutAll: lastName;
        nextPutAll: ', salary: ';
        nextPutAll: self weeklySalary asString;
        nextPutAll: ')'.

]

{ #category : 'salary' }
Programmer >> weeklySalary [
    actualHours >= minWeeklyHours
        ifTrue: [
            ^ hourlyRate * actualHours
        ]
        ifFalse: [
            ^ hourlyRate * actualHours * 0.75
        ].

]
