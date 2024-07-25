from init import get_connection
from faker import Faker

fake = Faker()


def inserePessoa():
    conn = get_connection()
    cursor = conn.cursor()

    nome = fake.name()
    nascimento = fake.date_of_birth(minimum_age=18, maximum_age=80).strftime("%Y-%m-%d")
    cursor.execute(
        "INSERT INTO pessoas (nome, nascimento) VALUES (%s, %s)", (nome, nascimento)
    )

    conn.commit()
    cursor.close()
    conn.close()


if __name__ == "__main__":
    inserePessoa()
