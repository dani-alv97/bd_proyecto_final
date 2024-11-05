USE algoritmosjabank;

-- Tabla Cliente
CREATE TABLE Cliente (
    cliente_id INT NOT NULL AUTO_INCREMENT,
    cliente_nombre VARCHAR(30) NOT NULL,
    cliente_tipo_identificacion VARCHAR(10),
    cliente_identificacion VARCHAR(20),
    cliente_correo_electronico VARCHAR(50),
    cliente_celular VARCHAR(15),
    cliente_fecha_creacion DATE,
    PRIMARY KEY (cliente_id)
);

INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Sandra Abril','C','0102030405','sandra@gmail.com','0995434762',NOW());
INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Christian Estrada','C','0104563251','christian@gmail.com','0939181763',NOW());
INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Santiago Parra','C','0301245789','santiago@gmail.com','0914561236',NOW());
INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Adrian Tene','C','0109585745','adrian@gmail.com','0932145200',NOW());
INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Pedro Mendez','C','0302514255','pedro@gmail.com','0932514777',NOW());
INSERT INTO Cliente (`cliente_nombre`,`cliente_tipo_identificacion`,`cliente_identificacion`,
					`cliente_correo_electronico`,`cliente_celular`,`cliente_fecha_creacion`)
VALUES('Carlos ALvarez','C','0142515151','carlos@gmail.com','0914561236',NOW());

-- Tabla Usuario
CREATE TABLE Usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT,
    usuario_name VARCHAR(255),
    usuario_clave VARCHAR(255),
    usuario_activo VARCHAR(1),
    usuario_fecha_registro DATE,
    PRIMARY KEY (usuario_id)
);

INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('s.abril','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());
INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('c.estrada','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());
INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('s.parra','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());
INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('a.tene','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());
INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('p.mendez','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());
INSERT INTO Usuario (`usuario_name`,`usuario_clave`,`usuario_activo`,`usuario_fecha_registro`)
VALUES('c.alvarez','$2a$12$CBcQkRNh/Vxihu3XmAoF3eRPNlgOGSNhWf1fecFNafcZYBJNjdX8u','S',NOW());

-- Tabla Usuario_cliente
CREATE TABLE Usuario_Cliente (
    uc_usuario_id INT NOT NULL,
    uc_cliente_id INT NOT NULL,
    PRIMARY KEY (uc_usuario_id, uc_cliente_id),
    FOREIGN KEY (uc_usuario_id) REFERENCES Usuario(usuario_id) ON DELETE CASCADE,
    FOREIGN KEY (uc_cliente_id) REFERENCES Cliente(cliente_id) ON DELETE CASCADE
);

INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(1,1);
INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(2,2);
INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(3,3);
INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(4,4);
INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(5,5);
INSERT INTO Usuario_Cliente (`uc_usuario_id`,`uc_cliente_id`)
VALUES(6,6);

-- Tabla Cuenta
CREATE TABLE Cuenta (
    cuenta_id INT NOT NULL AUTO_INCREMENT,
    cuenta_cliente_id INT NOT NULL,
    cuenta_tipo_cuenta VARCHAR(20),
    cuenta_saldo DECIMAL(16, 2),
    cuenta_fecha_apertura DATE,
    cuenta_activa VARCHAR(1),
    cuenta_fecha_creacion DATE,
    PRIMARY KEY (cuenta_id),
    FOREIGN KEY (cuenta_cliente_id) REFERENCES Cliente(cliente_id) ON DELETE CASCADE
);

INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (1, 'Ahorro', 100, DATE_SUB(NOW(), INTERVAL 365 DAY), 'S', NOW());
INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (2, 'Ahorro', 200, DATE_SUB(NOW(), INTERVAL 265 DAY), 'S', NOW());
INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (3, 'Ahorro', 300, DATE_SUB(NOW(), INTERVAL 165 DAY), 'S', NOW());
INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (4, 'Ahorro', 400, DATE_SUB(NOW(), INTERVAL 65 DAY), 'S', NOW());
INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (5, 'Ahorro', 50, DATE_SUB(NOW(), INTERVAL 365 DAY), 'S', NOW());
INSERT INTO Cuenta (`cuenta_cliente_id`, `cuenta_tipo_cuenta`, `cuenta_saldo`, `cuenta_fecha_apertura`,
                    `cuenta_activa`, `cuenta_fecha_creacion`)
VALUES (6, 'Ahorro', 60, DATE_SUB(NOW(), INTERVAL 465 DAY), 'S', NOW());

-- Tabla Movimiento
CREATE TABLE Movimiento (
    movimiento_id INT NOT NULL AUTO_INCREMENT,
    movimiento_cuenta_origen INT,
    movimiento_cuenta_destino INT,
    movimiento_fecha DATE,
    movimiento_debito_credito VARCHAR(10),
    movimiento_tipo_transaccion VARCHAR(20),
    movimiento_valor DECIMAL(16, 2),
    movimiento_observacion VARCHAR(100),
    movimiento_activo VARCHAR(1),
    PRIMARY KEY (movimiento_id),
    FOREIGN KEY (movimiento_cuenta_origen) REFERENCES Cuenta(cuenta_id) ON DELETE SET NULL,
    FOREIGN KEY (movimiento_cuenta_destino) REFERENCES Cuenta(cuenta_id) ON DELETE SET NULL
);