import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockApiService {
  // Simulate network delay
  static Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  // Mock login function
  static Future<Map<String, dynamic>> mockLogin(
      String email, String password) async {
    await _simulateNetworkDelay();

    // Mock validation
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Please fill all fields');
    }

    // Mock successful login
    if (email == 'admin@foodly.com' && password == 'password123') {
      return {
        'success': true,
        'token': 'mock_jwt_token_12345',
        'user': {
          'id': 'user_123',
          'email': email,
          'username': 'Admin User',
          'userType': 'admin'
        }
      };
    }

    // Mock failed login
    throw Exception('Invalid email or password');
  }

  // Mock registration function
  static Future<Map<String, dynamic>> mockRegister(
      String username, String email, String password) async {
    await _simulateNetworkDelay();

    // Mock validation
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('Please fill all fields');
    }

    // Mock password strength check
    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    // Mock email validation
    if (!email.contains('@')) {
      throw Exception('Please enter a valid email');
    }

    // Mock successful registration
    return {
      'success': true,
      'message': 'Registration successful! Please verify your email.',
      'user': {
        'id': 'new_user_${DateTime.now().millisecondsSinceEpoch}',
        'username': username,
        'email': email,
        'userType': 'requester'
      }
    };
  }
}