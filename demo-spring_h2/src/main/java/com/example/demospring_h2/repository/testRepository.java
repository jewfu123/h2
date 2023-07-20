package com.example.demospring_h2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demospring_h2.entity.test;

@Repository
public interface testRepository extends JpaRepository<test, Long> {

}
