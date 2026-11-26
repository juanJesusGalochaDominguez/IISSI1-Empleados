DELIMITER //

CREATE OR REPLACE PROCEDURE p_end_contract(
		IN p_employee_id INT,
		IN p_end_date DATE 
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
	
	SELECT end_date
	FROM employees
	WHERE employee_id = p_employee_id;
	
	end_date = p_end_date;
	
	SELECT employee_id 
	FROM employees
	WHERE employee_boss_id = p_employee_id;
	
	boss_id = p_employee_id.boss_id;
END //

CREATE OR REPLACE PROCEDURE f_num_subordinates(
	IN p_employee_id INT
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
	
	SELECT COUNT(*)
	FROM employees
	WHERE employee_boss_id = p_employee_id;
END //

DELIMITER ;



