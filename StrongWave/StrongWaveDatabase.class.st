"
StrongWaveDatabase — це проста імітація бази даних, яка зберігає працівників у пам’яті програми. 

Клас використовує Dictionary, де ключем є прізвище працівника, а значенням — сам об’єкт працівника.

Можливості класу:
- додавання працівника в 'базу' (addEmployee:)
- повернення всіх працівників (allEmployees)
- пошук працівника за прізвищем (findByLastName:)


"
Class {
	#name : 'StrongWaveDatabase',
	#superclass : 'Object',
	#instVars : [
		'employees'
	],
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'adding' }
StrongWaveDatabase >> addEmployee: anEmployee [
    employees at: anEmployee lastName put: anEmployee.

]

{ #category : 'accessing' }
StrongWaveDatabase >> allEmployees [
    ^ employees values.

]

{ #category : 'searching' }
StrongWaveDatabase >> findByLastName: aString [
    ^ employees at: aString ifAbsent: [ nil ].

]

{ #category : 'initialization' }
StrongWaveDatabase >> initialize [
    super initialize.
    employees := Dictionary new.

]
