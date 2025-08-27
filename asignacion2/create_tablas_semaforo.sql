-- TABALA INTERSECCION
CREATE TABLE Interseccion (
    id_interseccion SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion TEXT,
    num_carriles INT
);


-- TABLA SEMAFORO
CREATE TABLE Semaforo (
    id_semaforo SERIAL PRIMARY KEY,
    id_interseccion INT REFERENCES Interseccion(id_interseccion),
    direccion VARCHAR(50) -- norte, sur, este, oeste
);


-- TABLA ESTADO SEMAFORO
CREATE TABLE EstadoSemaforo (
    id_estado SERIAL PRIMARY KEY,
    id_semaforo INT REFERENCES Semaforo(id_semaforo),
    estado VARCHAR(10) CHECK (estado IN ('ROJO','AMARILLO','VERDE')),
    tiempo_duracion INT, -- segundos
    timestamp TIMESTAMP DEFAULT NOW()
);


-- TABLA SENSOR
CREATE TABLE Sensor (
    id_sensor SERIAL PRIMARY KEY,
    id_interseccion INT REFERENCES Interseccion(id_interseccion),
    tipo VARCHAR(20) CHECK (tipo IN ('VEHICULO','PEATON','BICICLETA','TRANSPORTE_PUBLICO'))
);


-- TABLA DATO SENSOR
CREATE TABLE DatoSensor (
    id_dato SERIAL PRIMARY KEY,
    id_sensor INT REFERENCES Sensor(id_sensor),
    cantidad INT,
    velocidad_promedio NUMERIC(5,2),
    timestamp TIMESTAMP DEFAULT NOW()
);


-- TABLA CAMARA
CREATE TABLE Camara (
    id_camara SERIAL PRIMARY KEY,
    id_interseccion INT REFERENCES Interseccion(id_interseccion),
    modelo VARCHAR(50),
    angulo_cobertura VARCHAR(50)
);


-- TABLA EVENTO CAMARA
CREATE TABLE EventoCamara (
    id_evento SERIAL PRIMARY KEY,
    id_camara INT REFERENCES Camara(id_camara),
    tipo_evento VARCHAR(30) CHECK (tipo_evento IN ('ACCIDENTE','INFRACCION')),
    descripcion TEXT,
    timestamp TIMESTAMP DEFAULT NOW()
);


-- TABLA EVENTO EMERGENCIA
CREATE TABLE EventoEmergencia (
    id_evento SERIAL PRIMARY KEY,
    id_interseccion INT REFERENCES Interseccion(id_interseccion),
    tipo VARCHAR(30) CHECK (tipo IN ('AMBULANCIA','BOMBEROS','POLICIA')),
    timestamp TIMESTAMP DEFAULT NOW()
);


-- TABLA ESTACIONAMIENTO
CREATE TABLE Estacionamiento (
    id_estacionamiento SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion TEXT,
    capacidad INT
);


-- TABLA ESPACIO ESTACIONAMIENTO
CREATE TABLE EspacioEstacionamiento (
    id_espacio SERIAL PRIMARY KEY,
    id_estacionamiento INT REFERENCES Estacionamiento(id_estacionamiento),
    numero VARCHAR(10),
    estado VARCHAR(10) CHECK (estado IN ('LIBRE','OCUPADO'))
);


-- TABLA USO ESTACIONAMIENTO
    CREATE TABLE UsoEstacionamiento (
    id_uso SERIAL PRIMARY KEY,
    id_espacio INT REFERENCES EspacioEstacionamiento(id_espacio),
    hora_entrada TIMESTAMP,
    hora_salida TIMESTAMP
);


-- TABLA CONGESTION
CREATE TABLE Congestion (
    id_congestion SERIAL PRIMARY KEY,
    id_interseccion INT REFERENCES Interseccion(id_interseccion),
    nivel VARCHAR(20) CHECK (nivel IN ('FLUIDO','MODERADO','CONGESTIONADO')),
    timestamp TIMESTAMP DEFAULT NOW()
);
