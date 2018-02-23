<?php
class My_model extends CI_Model
{
	function check_user($username,$password)
	{
		$this->db->where($username);
		$this->db->where($password);
		$query = $this->db->get('usr_user');
		//echo $this->db->last_query();
		if(!$query->num_rows() > 0)
		{
			return true;
			}
		else
			return false;
	}
	function select_max_id()
	{
		$query = $this->db->select_max('INVOICE_NO')->get('invoice');
		//echo $this->db->last_query();
		return $query->row();
	}
	function select_any_row($table,$where)
	{
		$query = $this->db->where($where)->get($table);
		return $query->row();
	}
	/////////////////////////////////////////////////
	function select_any_table($table,$where = NULL)
	{
		if($where = NULL)
		{
			$this->db->where($where);
			}
		$query = $this->db->get($table);
		return $query->result();
	}
	//////////////////////////////////////////
	function insert_data($table,$data)
	{
		$this->db->insert($table,$data);
		return true;
	}
	//////////////////////////////////////////////
	function update_any_table($table,$data,$where)
	{
		$this->db->where($where)->update($table,$data);
		//echo $this->db->last_query();
		return true;
	}
	/////////////////////////////////////////////
	function generated_invoices()
	{
		$this->db->distinct();
		$this->db->select('*')->from('invoice');
		$this->db->join('student','student.STUDENT_ID = invoice.student_id');
		//$this->db->join('invoice_log','invoice_log.INVOICE_NO = invoice.INVOICE_NO');
		//$this->db->join('charges','charges.CHARGE_ID = invoice_log.CHARGE_ID');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
	}
	/////////////// current_issue ///////////
	function current_issue_style()
	{
		$sql = 'SELECT DISTINCT 
				  * 
				FROM
				  `invoice` 
				  JOIN `student` 
					ON `student`.`STUDENT_ID` = `invoice`.`student_id`
					WHERE STATUS = 1
					ORDER BY INVOICE_NO DESC LIMIT 1';
		return $this->db->query($sql)->result();			
	}
	function canceling_current_issue_style($STUDENT_ID)
	{
		$sql = 'SELECT DISTINCT 
				  * 
				FROM
				  `invoice` 
				  JOIN `student` 
					ON `student`.`STUDENT_ID` = `invoice`.`student_id`
					WHERE STATUS = 1
					AND `student`.`STUDENT_ID` = '.$STUDENT_ID.'
					ORDER BY INVOICE_NO DESC  LIMIT 1';
		return $this->db->query($sql)->result();			
	}
	////////////////////////////////////////
	function canceling_current_issue_style_2($STUDENT_NO)
	{
	$sql = 'SELECT DISTINCT 
		  * 
		FROM
		  `invoice` 
		  JOIN `student` 
			ON `student`.`STUDENT_ID` = `invoice`.`student_id` 
		WHERE STATUS = 1 
		  AND `student`.`REGISTERATION_NO` = "'.$STUDENT_NO.'" 
		ORDER BY INVOICE_NO DESC 
		LIMIT 1 ';

		return $this->db->query($sql)->result();			
	}
	////////////////////// canceld invoices list ////////////////
	function current_issue_list()
	{
		$sql = 'SELECT DISTINCT 
				  * 
				FROM
				  `invoice` 
				  JOIN `student` 
					ON `student`.`STUDENT_ID` = `invoice`.`student_id`
					WHERE STATUS = 0
					ORDER BY INVOICE_NO ';
		return $this->db->query($sql)->result();			
	}
	////////////////////////////////////////////
	function current_issue_list_active()
	{
		$sql = 'SELECT DISTINCT 
				  * 
				FROM
				  `invoice` 
				  JOIN `student` 
					ON `student`.`STUDENT_ID` = `invoice`.`student_id`
					WHERE STATUS = 1
					ORDER BY INVOICE_NO ';
		return $this->db->query($sql)->result();
	}
	///////////////////////////////////////////
	function get_invoice_data($id)
	{
		$this->db->where('INVOICE_NO',$id)->select('*')->from('invoice');
		$this->db->join('student','student.STUDENT_ID=invoice.STUDENT_ID');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->row();
	}
	///////////////////////////////////
	function get_invoice_data2($id)
	{
		$this->db->where('INVOICE_NO',$id);
		//$this->db->select_sum('charges.CHARGE');
		$this->db->select('*')->from('invoice_log');
		$this->db->join('charges','charges.CHARGE_ID=invoice_log.CHARGE_ID');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
	}
}
?>