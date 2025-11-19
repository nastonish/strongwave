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
Employee >> experienceYears [
    ^ experienceYears
]

{ #category : 'accessing' }
Employee >> experienceYears: aNumber [
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
