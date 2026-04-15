package com.microbank.transaction.service;

import com.microbank.transaction.model.Transaction;
import com.microbank.transaction.repository.TransactionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TransactionService {

    private final TransactionRepository transactionRepository;

    public TransactionService(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    public List<Transaction> getAllTransactions() {
        return transactionRepository.findAll();
    }

    public Optional<Transaction> getTransactionById(Long id) {
        return transactionRepository.findById(id);
    }

    public List<Transaction> getTransactionsByAccount(String accountNumber) {
        List<Transaction> sent = transactionRepository.findByFromAccount(accountNumber);
        List<Transaction> received = transactionRepository.findByToAccount(accountNumber);
        sent.addAll(received);
        return sent;
    }

    public Transaction createTransaction(Transaction transaction) {
        if (transaction.getAmount() == null || transaction.getAmount().signum() <= 0) {
            throw new IllegalArgumentException("Transaction amount must be positive");
        }
        if (transaction.getType() == null || transaction.getType().isBlank()) {
            transaction.setType("TRANSFER");
        }
        transaction.setStatus("COMPLETED");
        return transactionRepository.save(transaction);
    }
}