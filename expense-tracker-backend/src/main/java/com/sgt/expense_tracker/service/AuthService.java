package com.sgt.expense_tracker.service;

import com.sgt.expense_tracker.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    @Autowired
    AuthService authService;
    public void register(User user){
//        check validity of email
//        check if email already exists
//        check if username already exists
//        hash password before register
//        if all passed then call repository to rergister
    }
}
