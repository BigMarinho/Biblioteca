using System;
using Microsoft.AspNetCore.Http;
using MySql.Data.MySqlClient;
using MySqlConnector;

namespace Biblioteca.Models
{
    public class UsuarioRepository
    {
        private const string DadosConexao = "Database=biblioteca; Data Source=localhost; User Id=root;";
        public Usuarios ValidarLogin (Usuarios u)
        {
            MySqlConnection Conexao = new MySqlConnection(DadosConexao);
            Conexao.Open();

            string Query = "SELECT * FROM usuarios WHERE login = @login AND senha = MD5(@senha);";
            MySqlCommand Comando = new MySqlCommand(Query, Conexao);

            Comando.Parameters.AddWithValue("@login", u.login);
            Comando.Parameters.AddWithValue("@senha", u.senha);

            MySqlDataReader Reader = Comando.ExecuteReader();

            Usuarios user = new Usuarios();
            user.id = 0;

            while (Reader.Read())
            {
                user.id = Reader.GetInt32("id");
                
                if (!Reader.IsDBNull(Reader.GetOrdinal("login")))
                {
                    user.login = Reader.GetString("login");
                }
                if (!Reader.IsDBNull(Reader.GetOrdinal("senha")))
                {
                    user.senha = Reader.GetString("senha");
                }
                if (!Reader.IsDBNull(Reader.GetOrdinal("privilegio")))
                {
                    user.privilegio = Reader.GetString("privilegio");
                }
            }
            Conexao.Close();

            return user;
        }
    }
}