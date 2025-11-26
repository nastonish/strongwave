Class {
	#name : 'EmployeeTest',
	#superclass : 'TestCase',
	#category : 'StrongWave-Tests',
	#package : 'StrongWave-Tests'
}

{ #category : 'tests' }
EmployeeTest >> testComparisonByWeeklySalary [
    | p m |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.   
    m := Manager
        lastName: 'Petrenko'
        experience: 10
        hourlyRate: 300
        subordinates: 5.   

    self assert: (p < m).
    self deny: (p > m).
    self deny: (p = m).

]

{ #category : 'tests' }
EmployeeTest >> testComparisonEqualSalaries [
    | p1 p2 |
    p1 := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 40.

    p2 := Programmer
        lastName: 'Petrov'
        experience: 5
        hourlyRate: 100
        minHours: 40
        actualHours: 40.

    self assert: (p1 = p2).
    self deny: (p1 < p2).
    self deny: (p1 > p2).

]

{ #category : 'tests' }
EmployeeTest >> testExperienceYearsCannotBeNegative [
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.

    self
        should: [ p experienceYears: -1 ]
        raise: Error.

]

{ #category : 'tests' }
EmployeeTest >> testHourlyRateCannotBeNegative [ 
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.

    self
        should: [ p hourlyRate: -50 ]
        raise: Error.

]

{ #category : 'tests' }
EmployeeTest >> testManagerWeeklySalaryWithSubordinates [
    | m |
    m := Manager
        lastName: 'Petrenko'
        experience: 10
        hourlyRate: 300
        subordinates: 5.
    self assert: m weeklySalary equals: 300 * 40 * (1 + (0.01 * 5)).

]

{ #category : 'tests' }
EmployeeTest >> testMinimumWeeklyHoursCannotBeNegative [
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.

    self
        should: [ p minWeeklyHours: -10 ]
        raise: Error.
]

{ #category : 'tests' }
EmployeeTest >> testProgrammerActualHoursCannotBeNegative [
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 30.

    self
        should: [ p actualHours: -5 ]
        raise: Error.
]

{ #category : 'tests' }
EmployeeTest >> testProgrammerWeeklySalaryFullHours [
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 40.
    self assert: p weeklySalary equals: 100 * 40.

]

{ #category : 'tests' }
EmployeeTest >> testProgrammerWeeklySalaryWithPenalty [
    | p |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 30.
    self assert: p weeklySalary equals: 100 * 30 * 0.75.

]

{ #category : 'tests' }
EmployeeTest >> testSalaryAddition [
    | p m sum |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.

    m := Manager
        lastName: 'Petrenko'
        experience: 10
        hourlyRate: 300
        subordinates: 5.

    sum := p + m.
    self assert: sum equals: (p weeklySalary + m weeklySalary).

]

{ #category : 'tests' }
EmployeeTest >> testSalaryMultiplication [
    | p result |
    p := Programmer
        lastName: 'Ivanov'
        experience: 3
        hourlyRate: 100
        minHours: 40
        actualHours: 38.

    result := p * 1.1.
    self assert: result equals: p weeklySalary * 1.1.

]
