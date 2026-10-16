" tr(), escape(), and shellescape()-style transforms.
echo tr('hello', 'el', 'ip')
echo tr('a-b-c', '-', '_')
echo escape('a.b*c', '.*')
echo escape('C:\dir', '\')
echo substitute('a/b/c', '/', '\\', 'g')
echo string("it's")
echo strtrans("tab\there")
