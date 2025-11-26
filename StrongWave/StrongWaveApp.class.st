"
StrongWaveApp — це клас, що керує колекцією працівників. 

Клас дозволяє:
- створити початковий набір працівників (createSampleEmployees),
- додавати нових працівників через діалогові вікна (addEmployeeFromDialog),
- зберігати список у внутрішній змінній employees,
- виводити всіх працівників у Transcript (printAllEmployees).



"
Class {
	#name : 'StrongWaveApp',
	#superclass : 'Object',
	#instVars : [
		'employees'
	],
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'adding' }
StrongWaveApp >> addEmployeeFromDialog [
    | ui type lastName exp rate minHours actualHours subs newEmployee |

    ui := UIManager default.

    type := ui chooseFrom: #('Programmer' 'Manager')
                title: 'Оберіть тип працівника'.
    type = 0 ifTrue: [ ^ self ].

    lastName := ui request: 'Введіть прізвище:'.
    exp := (ui request: 'Введіть стаж (роки):') asNumber.
    rate := (ui request: 'Введіть оплату за годину:') asNumber.

    type = 1 ifTrue: [
        minHours := (ui request: 'Мінімум годин на тиждень:') asNumber.
        actualHours := (ui request: 'Фактично відпрацьовані години:') asNumber.

        newEmployee := Programmer
            lastName: lastName
            experience: exp
            hourlyRate: rate
            minHours: minHours
            actualHours: actualHours.
    ].

    type = 2 ifTrue: [
        subs := (ui request: 'Кількість підлеглих:') asNumber.

        newEmployee := Manager
            lastName: lastName
            experience: exp
            hourlyRate: rate
            subordinates: subs.
    ].

    employees add: newEmployee.

]

{ #category : 'samples' }
StrongWaveApp >> createSampleEmployees [
    employees add: (Programmer
        lastName: 'Sydorenko'
        experience: 2
        hourlyRate: 150
        minHours: 40
        actualHours: 35).

    employees add: (Programmer
        lastName: 'Petrenko'
        experience: 3
        hourlyRate: 200
        minHours: 40
        actualHours: 42).

    employees add: (Manager
        lastName: 'Shevchenko'
        experience: 5
        hourlyRate: 250
        subordinates: 3).

    employees add: (Manager
        lastName: 'Ivanenko'
        experience: 10
        hourlyRate: 300
        subordinates: 5).

    employees add: (Programmer
        lastName: 'Koval'
        experience: 1
        hourlyRate: 120
        minHours: 30
        actualHours: 25).

]

{ #category : 'accessing' }
StrongWaveApp >> employees [
    ^ employees

]

{ #category : 'initialization' }
StrongWaveApp >> initialize [
    super initialize.
    employees := OrderedCollection new.

]

{ #category : 'accessing' }
StrongWaveApp >> managers [
    ^ employees select: [ :e | e isKindOf: Manager ]

]

{ #category : 'printing' }
StrongWaveApp >> printAllEmployees [
    employees do: [ :each |
        Transcript show: each; cr ].

]

{ #category : 'printing' }
StrongWaveApp >> printManagers [
    self managers do: [ :m |
        Transcript show: m; cr ].

]

{ #category : 'printing' }
StrongWaveApp >> printProgrammers [
    self programmers do: [ :p |
        Transcript show: p; cr ].

]

{ #category : 'accessing' }
StrongWaveApp >> programmers [
    ^ employees select: [ :e | e isKindOf: Programmer ]

]
