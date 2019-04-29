package com.neha.flightreservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.neha.flightreservation.entities.Role;

public interface RoleRepository extends JpaRepository<Role,Long> {

}
