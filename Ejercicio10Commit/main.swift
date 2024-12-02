import Foundation

// Estructura que representa una Sala de Reunión
struct SalaDeReunion {
    var nombre: String
    var capacidad: Int
    var fechaReserva: Date?  // Si no tiene fecha, está disponible
}

// Clase para gestionar las reservas de salas
class GestorDeReservas {
    var salas: [SalaDeReunion]
    
    init(salas: [SalaDeReunion]) {
        self.salas = salas
    }
    // Mostrar todas las salas disponibles
    func mostrarSalas() {
        print("\n--- Salas Disponibles ---")
        for sala in salas {
            let estado = sala.fechaReserva == nil ? "Disponible" : "Reservada para \(convertirFechaAString(fecha: sala.fechaReserva!))"
            print("\(sala.nombre) - Capacidad: \(sala.capacidad) personas - \(estado)")
        }
        print("-------------------------")
    }
    // Realizar una reserva
    func reservarSala(nombreSala: String, fecha: Date) -> Bool {
        if let index = salas.firstIndex(where: { $0.nombre == nombreSala }) {
            if salas[index].fechaReserva == nil { // La sala está disponible
                salas[index].fechaReserva = fecha
                print("Reserva realizada con éxito para \(salas[index].nombre) el \(convertirFechaAString(fecha: fecha)).")
                return true
            } else {
                print("La sala \(nombreSala) ya está reservada.")
                return false
            }
        } else {
            print("No existe una sala con ese nombre.")
            return false
        }
    }
    // Mostrar reservas existentes
    func mostrarReservas() {
        print("\n--- Reservas Actuales ---")
        var hayReservas = false
        for sala in salas {
            if let fecha = sala.fechaReserva {
                print("\(sala.nombre) - Capacidad: \(sala.capacidad) personas - Fecha de reserva: \(convertirFechaAString(fecha: fecha))")
                hayReservas = true
            }
        }
        if !hayReservas {
            print("No hay reservas actuales.")
        }
        print("-------------------------")
    }
    // Función para convertir una fecha a formato legible
    private func convertirFechaAString(fecha: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: fecha)
    }
}
func gestionarReservas() {
    // Crear salas iniciales
    let salasDeReunion = [
        SalaDeReunion(nombre: "Sala A", capacidad: 10, fechaReserva: nil),
        SalaDeReunion(nombre: "Sala B", capacidad: 20, fechaReserva: nil),
        SalaDeReunion(nombre: "Sala C", capacidad: 5, fechaReserva: nil)
    ]
    
    let gestor = GestorDeReservas(salas: salasDeReunion)
    var continuar = true
    
    while continuar {
        // Mostrar el menú principal
        print("\n¿Qué deseas hacer?")
        print("1. Ver salas disponibles")
        print("2. Realizar una reserva")
        print("3. Ver reservas")
        print("4. Salir")
        
        // Leer la opción seleccionada
        if let opcion = readLine(), let opcionInt = Int(opcion) {
            switch opcionInt {
            case 1:
                gestor.mostrarSalas() // Ver salas disponibles
            case 2:
                print("Ingresa el nombre de la sala que deseas reservar:")
                if let nombreSala = readLine() {
                    print("Ingresa la fecha de la reserva (formato: dd/MM/yyyy HH:mm):")
                    if let fechaString = readLine() {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
                        if let fecha = dateFormatter.date(from: fechaString) {
                            _ = gestor.reservarSala(nombreSala: nombreSala, fecha: fecha)
                        } else {
                            print("Formato de fecha no válido.")
                        }
                    }
                }
            case 3:
                gestor.mostrarReservas() // Ver reservas
            case 4:
                continuar = false
                print("¡Gracias por usar la aplicación!")
            default:
                print("Opción no válida. Por favor, selecciona un número entre 1 y 4.")
            }
        } else {
            print("Entrada no válida. Por favor, selecciona un número entre 1 y 4.")
        }
    }
}
