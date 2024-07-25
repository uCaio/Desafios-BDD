from faker import Faker
from init import get_connection

fake = Faker()


def adicionaPessoa():
    conn = get_connection()
    cursor = conn.cursor()

    for _ in range(100):
        nome = fake.name()
        nascimento = fake.date_of_birth(minimum_age=18, maximum_age=100).strftime(
            "%Y-%m-%d"
        )
        cursor.execute(
            "INSERT INTO pessoas (nome, nascimento) VALUES (%s, %s)", (nome, nascimento)
        )

    conn.commit()
    cursor.close()
    conn.close()


if __name__ == "__main__":
    adicionaPessoa()
