package com.moit.dto;

import lombok.Data;

@Data
public class UserDto {
	private int member_id;
	private String  login_id;
	private String  mobile;
	private String  nickname;
	private String  email;
	private String  password;
	private String  profile_url;
	
	private int member_type_id;
	private int status_id;
}


/*
mysql> desc users;
+----------+--------------+------+-----+-------------------+-------------------+
| Field    | Type         | Null | Key | Default           | Extra             |
+----------+--------------+------+-----+-------------------+-------------------+
| uno      | int          | NO   | PRI | NULL              | auto_increment    |
| nickname | varchar(20)  | NO   |     | NULL              |                   |
| bpass    | varchar(50)  | NO   |     | NULL              |                   |
| email    | varchar(100) | NO   |     | NULL              |                   |
| mobile   | varchar(50)  | NO   |     | NULL              |                   |
| udate    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| bip      | varchar(50)  | NO   |     | NULL              |                   |
+----------+--------------+------+-----+-------------------+-------------------+
7 rows in set (0.00 sec)

*/