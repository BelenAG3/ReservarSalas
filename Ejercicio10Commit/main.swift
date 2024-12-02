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
