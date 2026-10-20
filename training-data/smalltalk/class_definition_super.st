Object subclass: Animal [
    speak [ ^'...' ]
]
Animal subclass: Dog [
    speak [ ^super speak, ' woof' ]
]
Dog new speak printNl.
