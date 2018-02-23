<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('My_model');
		date_default_timezone_set('Asia/Karachi');
	}

	public function header()
	{
		$this->load->view('template/header');
	}
	public function footer()
	{
		$this->load->view('template/footer');
	}
	public function index()
	{
		//print_r($this->session->all_userdata()); exit;
		$data['student'] = $this->My_model->select_any_table('student'); 
		$data['charges'] = $this->My_model->select_any_table('charges'); //echo "<pre>".print_r($data); die;
		$data['invoice'] = $this->My_model->generated_invoices();//echo "<pre>".print_r($data['invoice']).'<pre>'; die;
		// die;
		$this->header();
		$this->load->view('template/body',$data);
		$this->footer();

	}
	//////////////login ////////////////////
	public function login()
	{
		$this->load->view('pages/login');
	}
	/////////////////////////////////////
	public function user_auth()
	{
		extract($_POST); //print_r($_POST);
		//$pass = 'superadmin';
		//$user = 'superadmin';
		$data['users'] = $this->My_model->check_user(array('USER_NAME' => $signin_username),array('U_PASSWORD' => md5($signin_password))); //print_r($data); die;
		if($data['users'] == true)
		 {

			$this->session->set_flashdata('error_msg','<div class="alert alert-danger alert-dark">Wrong Username Or Password!<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button></div>');
			redirect('welcome/login'); 
			
		}else{
			$this->session->set_userdata('user',$signin_username);
		redirect('welcome');
			
		}
		

	}
	////////////////////// Create Invoice ///////////////////
	public function create_invoice()
	{
		extract($_POST); //print_r($_POST);
		
		$max_id = $this->My_model->select_max_id()->INVOICE_NO+1;  
		//var_dump( $max_id); 
		$invoice_data = array(
								'INVOICE_NO'   =>   	$max_id,
								'INVOICE_DATE'   => 	 date('Y-m-d'),
								'STUDENT_ID'    =>  	$student_id,
								'DUE_DATE'		=>  	date("Y-m-d",strtotime($due_date))
								); //print_r($invoice_data); die;
		$data = $this->My_model->insert_data('invoice',$invoice_data);
		for($i=0; $i<=count($charge_id)-1; $i++)
		{
			$invoice_log = array(
								'INVOICE_NO'   	=> 		$max_id,
								'CHARGE_ID'		=> 		$charge_id[$i],
								'INVOICE_DATE' 	=> 		date('Y-m-d'),
								'DUE_DATE'		=>  	date("Y-m-d",strtotime($due_date))
								);
			$this->My_model->insert_data('invoice_log',$invoice_log);
		}
		if($data == true)
		{
		$this->session->set_flashdata('msg','<div class="alert alert-dark alert-success">Invoice Generated Sucessfully</div>');
		redirect('Welcome');
		}
	}
	////////////////////get_invoice_data//////////////////////
	function get_invoice_data(){
		extract($_POST);
		//if($this->uri->segment(3) != NULL)
//		{
//			$id = $this->uri->segment(3);
//			//$this->header();
//		}
		$data['invoice_log'] = $this->My_model->get_invoice_data($id);
		$data['details'] = $this->My_model->get_invoice_data2($id);
	//print_r($data['invoice_log']);
		if(($data['invoice_log']->STATUS == 0))
		{
			$status =  'Cancelled';
		}
		else {
			$status = 'Active';
			}
		
		echo '<div class="container">
    <div class="row">
        <div class="col-xs-8 col-md-8 col-lg-8">
			
            <div class="text-center">
				
                <img src="'.base_url("assets/images/logo.png").'" height="100px" width="100px" class="">
                <h4>University Of Engineering And Technology Peshawar</h4>
            </div>
            <hr>
            <div class="row">
                <div class="col-xs-12 col-md-12  pull-left">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Invoice Information</div>
                        <div class="panel-body">
							Department :
							<strong>'.$data['invoice_log']->DEPARTMENT.'</strong><br>
							 To:
                            <strong>'.$data['invoice_log']->STUDENT_NAME.'</strong><br>
							Registeration NO :
							<strong>'.$data['invoice_log']->REGISTERATION_NO.'</strong><br>
							 Date of Issue: <strong>
                            '.date('Y-m-d',strtotime($data['invoice_log']->INVOICE_DATE)).'</strong><br>
							
                            Due date : <strong>'.date('Y-m-d',strtotime($data['invoice_log']->DUE_DATE)).'</strong><br>
                            Status : <strong>'.$status.'</strong>
                        <hr>
                  
      				<solid>Charges Information</solid>
            
                    <div class="table-responsive">
						<div class="col-sm-6">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td><strong>#</strong></td>
                                    <td class="text-center"><strong>Charges</strong></td>
                                    
                                </tr>
                            </thead>
                            <tbody>';
							$a = 1;
							$charge = '';
							foreach($data['details'] as $row){
                               echo '<tr>
                                    <td>'.$a++.'</td>
                                    <td class="text-center">'.$row->CHARGE.' Pkr</td>
                                    
                                </tr>';
								$charge += $row->CHARGE;
                                }
                             echo '<tr>
                                    
                                    <td class="highrow text-center"><strong>Total</strong></td>
                                    <td class="highrow text-right">'.$charge.' Pkr</td>
                                </tr>';
							
                            echo '</tbody>
                        </table>
                    
                </div>
            </div>
        </div>
    </div>
</div>';
	}
	///////////////// current isssue ///////////////
	function current_issue()
	{
		$data['student'] = $this->My_model->select_any_table('student'); 
		$data['charges'] = $this->My_model->select_any_table('charges');
		$data['invoice'] = $this->My_model->current_issue_style(); //print_r($data);exit;
		$this->header();
		$this->load->view('pages/current_issue',$data);
		$this->footer();
	}
	/////////////////////// Cancel invoice ////////////////
	function cancel_invoice($id)
	{
		
		$data['check'] = $this->My_model->select_any_row('invoice',array('INVOICE_NO' => $id)); 
		if($data['check']->STATUS == 1)
		{
			$status = 0;
		}
		else
		{
			$status = 1;
		}
		$this->My_model->update_any_table('invoice',array('STATUS' => $status),array('INVOICE_NO ' => $id));
		$this->session->set_flashdata('msg','<div class="alert alert-dark alert-danger">Invoice Cancelled Successfully</div>');
		redirect('Welcome');
	}
	///////////////////////////////////////////////////
	function cancelled_invoices()
	{
		$data['student'] = $this->My_model->select_any_table('student'); 
		$data['charges'] = $this->My_model->select_any_table('charges');
		$data['invoice'] = $this->My_model->current_issue_list(); //print_r($data);exit;
		$this->header();
		$this->load->view('pages/cancelled_list',$data);
		$this->footer();
	}
	///////////////////////////////////////////////
	function Invoice_list()
	{
		$data['student'] = $this->My_model->select_any_table('student'); 
		$data['charges'] = $this->My_model->select_any_table('charges');
		$data['invoice'] = $this->My_model->current_issue_list_active(); //print_r($data);exit;
		$this->header();
		$this->load->view('pages/cancelled_list',$data);
		$this->footer();
	}
	//////////////// Cancel Invoice stduent wise ///////////
	function cancel_invoice_student_wise()
	{
		$data['student'] = $this->My_model->select_any_table('student'); //print_r($data); exit;
		$data['student_no'] = $this->My_model->select_any_table('student');
		$this->header();
		$this->load->view('pages/cancel_invoice_student_wise',$data);
		$this->footer();
	}
	/////////////////// get invoice list //////////////////
	public function get_invoice_for_canceling()
	{
		$student_no =NULL;
		$student_id = NULL;
		extract($_POST);
		
		//print_r($_POST); die;
		if($student_no != NULL){
			$data['list'] = $this->My_model->canceling_current_issue_style_2($student_no);
			}
		if($student_id != NULL){
			$data['list'] = $this->My_model->canceling_current_issue_style($student_id);
		}	
		 //print_r($data);
		if(!$data['list'] >0)
		{
			echo '<tr><td colspan="6"><h2 style="color:#E35240" align="center">Sorry No record Found !</h2></td></tr>';
		}
		else
		{
			$a = 1;
			foreach($data['list'] as $row){
					echo '<tr>
								
                                        <td>'.$row->INVOICE_NO.'</td>
                                        <td>'.$row->STUDENT_NAME.'</td>
                                         <td>'.$row->DEPARTMENT.'</td>
                                        <td>'.$row->INVOICE_DATE.'</td>
                                        <td>'.$row->DUE_DATE.'</td>
                                        <td>';
                                        	if($row->STATUS==1){
										echo	'<div class="label label-primary"> Initiated...</div>';
                                             }else{
                                            echo '<div class="label label-danger"> Cancelled...</div>';
                                             }
                                     echo '</td>
                                        <td>
                                        <div class="btn-group btn-sm">
                                            <button href="#" value="'.$row->INVOICE_NO.'" onClick="get_value_invoice(this.value)" class="btn btn-info" data-toggle="modal" data-target=".bs-example-modal-lg"><span class="fa fa-eye"></span>View</button>';
                                            if($row->STATUS == 0){
                                            echo	'<a href="#" class=" cancelled btn  " style="color:#F00;">Cancelled</a>';
                                            }else{
                                            echo '<button value="'.$row->INVOICE_NO.'" onClick="cancel_the_list(this.value)" class="btn btn-danger">Cancel</button>';
                                             }
                                       echo' </div>	
                                            </td>';
				}
		}
	}
	//////////// cancel invoice old style ///////////////////
	public function cancel_invoice_old_style()
	{
		extract($_POST); //echo $id;
		$data['check'] = $this->My_model->select_any_row('invoice',array('INVOICE_NO' => $student_id)); //print_r($data); exit;
		if($data['check']->STATUS == 1)
		{
			$status = 0;
		}
		else
		{
			$status = 1;
		}
		$update = $this->My_model->update_any_table('invoice',array('STATUS' => $status),array('INVOICE_NO ' => $student_id));
		if($update == true):
			$data['list'] = $this->My_model->canceling_current_issue_style($student_id); //print_r($data);
				if(!$data['list'] >0)
			{
				echo '<tr><td colspan="6"><h2 style="color:#E35240" align="center">Sorry No record Found !</h2></td></tr>';
			}
			else
			{
				$a = 1;
				foreach($data['list'] as $row){
						echo '<tr>
									
											<td>'.$row->INVOICE_NO.'</td>
											<td>'.$row->STUDENT_NAME.'</td>
											
											<td>'.$row->INVOICE_DATE.'</td>
											<td>'.$row->DUE_DATE.'</td>
											<td>';
												if($row->STATUS==1){
											echo	'<div class="label label-primary"> Active...</div>';
												 }else{
												echo '<div class="label label-danger"> Cancelled...</div>';
												 }
										 echo '</td>
											<td>
											<div class="btn-group btn-sm">
												<button href="#" value="'.$row->INVOICE_NO.'" onClick="get_value_invoice(this.value)" class="btn btn-info" data-toggle="modal" data-target=".bs-example-modal-lg"><span class="fa fa-eye"></span>View</button>';
												if($row->STATUS == 0){
												echo	'<a href="#" class=" cancelled btn  " style="color:#F00;">Cancelled</a>';
												}else{
												echo '<button value="'.$row->INVOICE_NO.'" onClick="cancel_the_list(this.value)" class="btn btn-danger">Cancel</button>';
												 }
										   echo' </div>	
												</td>';
					}
		}
		endif;
	}
 	//////////////////////logout ////////////////////////////
	public function logout()
	{
	$this->session->sess_destroy();
	redirect('welcome/login');
	}
}
