import xml.etree.ElementTree as ET
import time

# Archivo de entrada
input_file = "../Datos/FullOct2007.xml"

# Categorías a extraer
categorias_deseadas = {"Religion & Spirituality", "Newborn & Baby", "Law & Ethics", "Investing"}

# Crear archivos de salida por categoría
output_files = {cat: open(f"{cat.replace(' ', '_')}.xml", "wb") for cat in categorias_deseadas}

# Medir tiempo de inicio
start_time = time.time()

# Escribir encabezados XML en cada archivo
for f in output_files.values():
    f.write(b'<?xml version="1.0" encoding="UTF-8"?>\n<Category>\n')

# Contadores
total_preguntas = 0
preguntas_por_categoria = {cat: 0 for cat in categorias_deseadas}

# Procesar XML eficientemente
context = ET.iterparse(input_file, events=("start", "end"))
current_document = None

for event, elem in context:
    if event == "start" and elem.tag == "document":
        current_document = elem  # Guardar referencia al documento actual

    if event == "end" and elem.tag == "cat":  
        categoria = elem.text  
        if categoria in categorias_deseadas and current_document is not None:
            xml_str = ET.tostring(current_document, encoding="utf-8")
            output_files[categoria].write(xml_str + b"\n")
            preguntas_por_categoria[categoria] += 1
            total_preguntas += 1
        
        elem.clear()  # Liberar memoria
        current_document = None  # Resetear para el siguiente documento

# Escribir cierre de XML y cerrar archivos
for f in output_files.values():
    f.write(b"</Category>")
    f.close()

# Medir tiempo de finalización
end_time = time.time()
elapsed_time = end_time - start_time

# Mostrar estadísticas
print(f"Tiempo total: {elapsed_time:.2f} segundos")
print(f"Total de preguntas procesadas: {total_preguntas}")
for cat, count in preguntas_por_categoria.items():
    print(f"Preguntas en '{cat}': {count}")
