package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

public class Usuario {
  private int id;
  private String nom;
  private String ape;
  private String pass;
  private String email;
  private String movil;
  private  Integer ciu;

  public Usuario(ResultSet result) {
    try {
      this.id = result.getInt("IDusu");
      this.nom = result.getString("NomUsu");
      this.ape = result.getString("ApeUsu");
      this.pass = result.getString("PassUsu");
      this.email = result.getString("Email");
      this.movil = result.getString("Movil");
      this.ciu = result.getInt("IDciu");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public Usuario(String nom, String ape, String pass, String email, String movil, Integer ciu) {
      this.nom = nom;
      this.ape = ape;
      this.pass = pass;
      this.email = email;
      this.movil = movil;
      this.ciu = ciu;
  }
}
