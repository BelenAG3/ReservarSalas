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

