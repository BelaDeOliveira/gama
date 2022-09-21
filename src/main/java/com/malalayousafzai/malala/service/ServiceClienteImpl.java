package com.malalayousafzai.malala.service;

import com.malalayousafzai.malala.DAO.ClienteDAO;
import com.malalayousafzai.malala.model.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ServiceClienteImpl implements IServiceCliente {

    @Autowired
    private ClienteDAO clienteDao;

    @Override
    public Cliente criarNovo(Cliente novo){
        if(novo.getNome() != null){
            return clienteDao.save(novo);
        }
        return null;
    }

    @Override
    public ArrayList<Cliente> listar(){
        return (ArrayList<Cliente>) clienteDao.findAll();
    }

    //Retificar o metodo abaixo
    @Override
    public Cliente alterarDados(Cliente dados){
        if (dados.getId() != null && dados.getNome() != null){
            return clienteDao.save(dados);
        }
        return null;
    }

}