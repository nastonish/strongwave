"
Клас Manager моделює керівника, який працює фіксовану кількість годин на тиждень (в нашому випадку 40) і отримує додаткові нарахування (1%) за кожного підлеглого. гетери та сетери для subordinatesCount — кількості підлеглих працівників;
метод initialize, який встановлює мінімальну кількість годин на тиждень (40) та початкову кількість підлеглих (0);
перевизначений метод weeklySalary, що обчислює зарплату з урахуванням надбавки за підлеглих;
конструктор для створення менеджера з відповідними параметрами (прізвище, стаж, ставка, кількість підлеглих);

"
Class {
	#name : 'Manager',
	#superclass : 'Employee',
	#instVars : [
		'subordinatesCount'
	],
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'instance creation' }
Manager class >> lastName: aString
experience: years
hourlyRate: rate
subordinates: count [

    ^ self new
        lastName: aString;
        experienceYears: years;
        hourlyRate: rate;
        minWeeklyHours: 40;
        subordinatesCount: count;
        yourself

]

{ #category : 'initialization' }
Manager >> initialize [
    super initialize.
    minWeeklyHours := 40.  
    subordinatesCount := 0

]

{ #category : 'printing' }
Manager >> printOn: aStream [
    super printOn: aStream.
    aStream
        nextPutAll: ', subordinates: ';
        print: subordinatesCount

]

{ #category : 'accessing' }
Manager >> subordinatesCount [
    ^ subordinatesCount

]

{ #category : 'accessing' }
Manager >> subordinatesCount: aNumber [
    aNumber < 0 ifTrue: [
        self error: 'Кількість підлеглих не може бути від''ємною' ].
    subordinatesCount := aNumber

]

{ #category : 'salary' }
Manager >> weeklySalary [
    | base |
    base := hourlyRate * 40.
    ^ base * (1 + (0.01 * subordinatesCount))

]
