"
""Клас Employee моделює працівника із базовими характеристиками:
- lastName — прізвище працівника;
- experienceYears — кількість років досвіду (стаж);
- hourlyRate — ставка оплати за годину роботи;
- minWeeklyHours — мінімальна кількість годин, які працівник має відпрацювати за тиждень.""
"
Class {
	#name : 'Employee',
	#superclass : 'Object',
	#instVars : [
		'lastName',
		'experienceYears',
		'hourlyRate',
		'minWeeklyHours'
	],
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'accessing' }
Employee class >> lastName: aString experience: years hourlyRate: rate minHours: hours [
    ^ self new
        lastName: aString;
        experienceYears: years;
        hourlyRate: rate;
        minWeeklyHours: hours;
        yourself.

]

{ #category : 'instance creation' }
Employee class >> lastName: aString
	experienceYears: years
	hourlyRate: rate
	minWeeklyHours: minHours [

	^ self new
		lastName: aString;
		experienceYears: years;
		hourlyRate: rate;
		minWeeklyHours: minHours;
		yourself

]

{ #category : 'arithmetic' }
Employee >> * aNumber [
    ^ self weeklySalary * aNumber
]

{ #category : 'arithmetic' }
Employee >> + aWorker [
    ^ self weeklySalary + aWorker weeklySalary
]

{ #category : 'comparing' }
Employee >> < aWorker [
    ^ self weeklySalary < aWorker weeklySalary

]

{ #category : 'comparing' }
Employee >> <= aWorker [
    ^ (self < aWorker) or: [self = aWorker]
]

{ #category : 'comparing' }
Employee >> = aWorker [
    ^ self weeklySalary = aWorker weeklySalary

]

{ #category : 'comparing' }
Employee >> > aWorker [
    ^ aWorker < self

]

{ #category : 'comparing' }
Employee >> >= aWorker [
    ^ (self > aWorker) or: [self = aWorker]
]

{ #category : 'accessing' }
Employee >> experienceYears [
    ^ experienceYears
]

{ #category : 'accessing' }
Employee >> experienceYears: aNumber [
	 aNumber < 0 ifTrue: [ self error: 'Experience years cannot be negative' ].
    experienceYears := aNumber
]

{ #category : 'accessing' }
Employee >> hourlyRate [
    ^ hourlyRate
]

{ #category : 'accessing' }
Employee >> hourlyRate: aNumber [
    hourlyRate := aNumber
]

{ #category : 'initialization' }
Employee >> initialize [
    super initialize.
    experienceYears := 0.
    hourlyRate := 0.
    minWeeklyHours := 0.

]

{ #category : 'accessing' }
Employee >> lastName [
    ^ lastName
]

{ #category : 'accessing' }
Employee >> lastName: aString [
    lastName := aString
]

{ #category : 'accessing' }
Employee >> minWeeklyHours [
    ^ minWeeklyHours
]

{ #category : 'accessing' }
Employee >> minWeeklyHours: aNumber [
    minWeeklyHours := aNumber
]

{ #category : 'printing' }
Employee >> printOn: aStream [
    super printOn: aStream.
    aStream
        nextPutAll: ' (';
        nextPutAll: lastName;
        nextPutAll: ', experience: ';
        print: experienceYears;
        nextPutAll: ', hourly rate: ';
        print: hourlyRate;
        nextPutAll: ', min hours: ';
        print: minWeeklyHours;
        nextPut: $).

]

{ #category : 'salary' }
Employee >> weeklySalary [
    "Return weekly salary for a basic employee"
    
    ^ self subclassResponsibility
]
