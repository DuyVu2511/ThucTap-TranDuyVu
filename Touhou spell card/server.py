from flask import Flask, jsonify
from flask_cors import CORS
import pyodbc
import urllib.parse

app = Flask(__name__)
CORS(app)

# --- Cấu hình kết nối SQL Server ---
server = 'TDV-LAPTOP\\DUYVU'
database = 'TouhouSpellCards'
username = 'tdv2210900138'
password = '25112004'
driver = 'ODBC Driver 17 for SQL Server'

def get_connection():
    conn_str = f'DRIVER={{{driver}}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
    return pyodbc.connect(conn_str)

# --- Endpoint: lấy danh sách game ---
@app.route("/games", methods=["GET"])
def get_games():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT GameTitle, ReleaseYear FROM Game")
    rows = cursor.fetchall()
    conn.close()
    games = [{"GameTitle": r[0], "ReleaseYear": r[1]} for r in rows]
    return jsonify(games)

# Route cho Non-Spell
@app.route('/games/<game_title>/spellcards/non-spell', methods=['GET'])
def get_non_spell(game_title):
    # Decode URL (tránh lỗi khi có %20)
    game_title = urllib.parse.unquote(game_title)

    conn = get_connection()
    # Query chỉ lấy Non-Spell
    query = """
    SELECT * FROM SpellCard
    WHERE game_title = ? AND type = 'Non-Spell'
    """
    spellcards = conn.execute(query, (game_title,)).fetchall()
    conn.close()

    return jsonify([dict(row) for row in spellcards])

# Route cho Spell Card
@app.route('/games/<game_title>/spellcards/spell-card', methods=['GET'])
def get_spell_card(game_title):
    # Decode URL
    game_title = urllib.parse.unquote(game_title)

    conn = get_connection()
    # Query chỉ lấy Spell Card
    query = """
    SELECT * FROM SpellCard
    WHERE game_title = ? AND type = 'Spell Card'
    """
    spellcards = conn.execute(query, (game_title,)).fetchall()
    conn.close()

    return jsonify([dict(row) for row in spellcards])


if __name__ == "__main__":
    app.run(debug=True)