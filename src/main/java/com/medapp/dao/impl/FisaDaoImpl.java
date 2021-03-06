package com.medapp.dao.impl;


import com.medapp.dao.ClientDao;
import com.medapp.dao.DintiiDao;
import com.medapp.dao.FisaDao;
import com.medapp.model.Client;
import com.medapp.model.Dintii;
import com.medapp.model.Fisa;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by Root on 27.12.2016.
 */

@Repository
@Transactional
public class FisaDaoImpl implements FisaDao {

  @Autowired
  private SessionFactory sessionFactory;

  @Autowired
  private ClientDao clientDao;

  @Autowired
  private DintiiDao dintiiDao;

  public void addFisa(Fisa fisa) {
    Session session = sessionFactory.getCurrentSession();
    LocalDate today = LocalDate.now();
    Date date = java.sql.Date.valueOf(today);
    fisa.setDate(date);
    session.saveOrUpdate(fisa);
    Client client = clientDao.getClientById(fisa.getClient().getClientId());
    Dintii dintii = fisa.getDintii();
    dintii.setFisa(fisa);
    session.saveOrUpdate(dintii);
    client.setFisa(fisa);
    session.saveOrUpdate(client);
    session.flush();
  }

  public void editFisa(Fisa fisa) {
    Session session = sessionFactory.getCurrentSession();
    LocalDate today = LocalDate.now();
    Date date = java.sql.Date.valueOf(today);
    fisa.setDateEdited(date);
    session.saveOrUpdate(fisa);
    dintiiDao.editDintii(fisa.getDintii());
    session.flush();
  }

  public Fisa getFisaById(int fisaId) {
    Session session = sessionFactory.getCurrentSession();
    Fisa fisa = (Fisa) session.get(Fisa.class, fisaId);
    session.flush();
    return fisa;
  }

  public List<Fisa> getAllFisas() {
    return null;
  }

  public void deleteFisa(int fisaId) {

  }
}
