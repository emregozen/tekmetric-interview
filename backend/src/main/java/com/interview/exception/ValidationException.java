package com.interview.exception;

/**
 * Exception thrown when input validation fails.
 */
public class ValidationException extends RuntimeException {

    public ValidationException(String message) {
        super(message);
    }
}
