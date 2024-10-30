Ubuntool is a tool for ubuntu, primarily the cyberpatriot program.
Dissasembler lets you dissasmle your own script's functions and add them to ubuntool modules. doesn't always work.
Run with sudo 99% of the time.


Module info:
	Dont put readmes on your modules in the modules section. Put them and data in db.
	Make sure to chmod (i use 755) the modules so they can run.
	Python and other coding languages should work as modules, this is untested though.
	Change updatescript.sh if your scripts add any dependencies or if certain parts of it have long load times but only need to be loaded once.
	Remember that using the dissasembler sepearates things by function, so modules with functions dependent on eachother in them cant be dissasembled.
	Dissasembler also doesnt replace returns with exits.
	(Working on these two)
	
