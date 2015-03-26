<?php

class Controller_User extends System_Controller{
    static $test;
    public function indexAction() {
        
    }
    
    public function profileAction() 
    {
        $args = $this->_getArguments();
        
        $userId = $args['id'];
        try {
            $modelUser = Model_User::getById($userId);
            $this->view->setParam('user', $modelUser);
        }
        catch (Exception $e) {
            $this->view->setParam('error', $e->getMessage());
        }
        $this->test = new ReflectionClass('Controller_User');
//        echo "<pre>";
//        Reflection::export($this->test);
//        echo '</pre>';
//       
    }
    
    public function fibonacciAction()
    {
        $args = $this->_getArguments();
        $number = $args['numb'];
        
        function fibo($number)
        {
            if($number < 3) {
                return 1;
            }
            else {
                return fibo($number-1) + fibo($number -2);
            }
        }
        fibo($number);
        for($number = 1; $number <=16; $number++ ){
            echo(fibo($number) . ", ");
            }
    }
}

