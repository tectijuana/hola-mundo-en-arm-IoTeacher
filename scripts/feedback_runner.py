import os, glob
from openai import OpenAI

MODEL = os.getenv("MODEL_MAIN", "gpt-5-mini")
client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])
rubrica = os.environ.get("RUBRICA_PROMPT", "Da retroalimentación breve en español.")

def read_sources():
    chunks = []
    paths = sorted(glob.glob("src/**/*.S", recursive=True) + glob.glob("src/**/*.s", recursive=True))
    if not paths:
        return "<sin código .S/.s en /src>"
    for path in paths:
        try:
            with open(path, "r", encoding="utf-8", errors="ignore") as f:
                chunks.append(f"\n---\nArchivo: {path}\n\n{f.read()}\n")
        except Exception as e:
            chunks.append(f"\n---\nArchivo: {path}\n\n<error leyendo archivo: {e}>\n")
    return "".join(chunks)

def read_results():
    try:
        with open("tests/results.txt", "r", encoding="utf-8", errors="ignore") as f:
            return f.read()
    except:
        return "(sin resultados)"

codigo = read_sources()
logs = read_results()

prompt = f"""{rubrica}

Código del estudiante:
{codigo}

Resumen de autograding (logs):
{logs}
"""

resp = client.responses.create(model=MODEL, input=prompt)
feedback = resp.output_text.strip()

with open("FEEDBACK.md", "w", encoding="utf-8") as f:
    f.write(feedback)
