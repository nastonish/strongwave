"
StrongWaveStorage — допоміжний клас, який відповідає за збереження 
та завантаження об’єктів працівників у різні формати файлів (txt, csv). 
 
"
Class {
	#name : 'StrongWaveStorage',
	#superclass : 'Object',
	#category : 'StrongWave',
	#package : 'StrongWave'
}

{ #category : 'saving' }
StrongWaveStorage class >> loadEmployeesFromTxtFile: fileName [
    | stream lines |
    stream := fileName asFileReference readStream.
    lines := stream contents lines.
    stream close.

    ^ lines.

]

{ #category : 'saving' }
StrongWaveStorage class >> saveEmployees: aCollection toCSVFile: fileName [
    | stream |
    stream := fileName asFileReference writeStream.

    stream nextPutAll: 
        'type,lastName,experience,hourlyRate,minHours,actualHours,subordinatesCount'; 
        cr.

    aCollection do: [ :emp |

        (emp isKindOf: Programmer)
            ifTrue: [
                stream 
                    nextPutAll: 'Programmer,',
                    emp lastName, ',',
                    emp experienceYears printString, ',',
                    emp hourlyRate printString, ',',
                    emp minWeeklyHours printString, ',',
                    emp actualHours printString, ',',
                    '0'; cr ].

        (emp isKindOf: Manager)
            ifTrue: [
                stream 
                    nextPutAll: 'Manager,',
                    emp lastName, ',',
                    emp experienceYears printString, ',',
                    emp hourlyRate printString, ',',
                    '40,',   
                    '0,',    
                    emp subordinatesCount printString; cr ].
    ].

    stream close.

]

{ #category : 'saving' }
StrongWaveStorage class >> saveEmployees: aCollection toTxtFile: fileName [
    | stream |
    stream := fileName asFileReference writeStream.
    aCollection do: [ :emp |
        stream nextPutAll: emp printString; cr ].
    stream close.

]
