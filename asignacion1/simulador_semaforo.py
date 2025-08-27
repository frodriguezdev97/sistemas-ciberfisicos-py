import time

def mostrar_estado(color):
    print(f"LUZ {color.upper()}")
    print("-" * 20)

def semaforo(modo_trafico="normal", accesibilidad=False):
    while True:
        # Luz roja
        mostrar_estado("rojo")
        time.sleep(3)

        # Luz amarilla
        mostrar_estado("amarillo")
        time.sleep(1)

        # Luz verde
        mostrar_estado("verde")
        duracion_verde = 3  # duración por defecto

        if modo_trafico == "hora pico":
            duracion_verde = 5

        if accesibilidad:
            duracion_verde += 2  # tiempo extra para personas con discapacidad

        time.sleep(duracion_verde)
        print()  # espacio entre ciclos

# -------- INICIO DEL PROGRAMA --------
print("Simulador de Semáforo")
print("=====================")

# Preguntar modo de tráfico
modo = input("¿Es hora pico? (s/n): ").lower()
modo_trafico = "hora pico" if modo == "s" else "normal"

# Preguntar accesibilidad
acceso = input("¿Hay personas con discapacidad esperando cruzar? (s/n): ").lower()
accesibilidad = True if acceso == "s" else False

# Iniciar semáforo
semaforo(modo_trafico, accesibilidad)
