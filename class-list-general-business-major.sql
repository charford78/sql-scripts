SELECT m.Description, c.Code, c.Subject, Section
	from major m
	join majorclass mc
		on m.id = mc.majorid
	join class c
		on mc.classid = c.id
	where m.Code = 'GENB';