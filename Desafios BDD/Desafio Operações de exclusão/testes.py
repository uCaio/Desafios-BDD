import unittest
from init import get_connection
from adiciona import adicionaPessoa
from exclui import excluiPessoa
from insere import inserePessoa


class TesteOperacoesBancodeDados(unittest.TestCase):
    def setUp(self):
        self.conn = get_connection()
        self.cursor = self.conn.cursor()
        self.cursor.execute("TRUNCATE TABLE pessoas")  # Limpa a tabela para testes

    def tearDown(self):
        self.cursor.close()
        self.conn.close()

    def test_adiciona_pessoa(self):
        adicionaPessoa()
        self.cursor.execute("SELECT COUNT(*) FROM pessoas")
        count = self.cursor.fetchone()[0]
        self.assertEqual(count, 100)

    def test_exclui_pessoa(self):
        adicionaPessoa()
        excluiPessoa()
        self.cursor.execute("SELECT COUNT(*) FROM pessoas")
        count = self.cursor.fetchone()[0]
        self.assertEqual(count, 90)

    def test_insere_pessoa(self):
        adicionaPessoa()
        excluiPessoa()
        inserePessoa()
        self.cursor.execute("SELECT COUNT(*) FROM pessoas")
        count = self.cursor.fetchone()[0]
        self.assertEqual(count, 91)


if __name__ == "__main__":
    unittest.main()
