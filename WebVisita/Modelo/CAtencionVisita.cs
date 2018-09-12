namespace WebVisita
{
    public class CAtencionVisita
    {
        private int _visitaID;
        private int _organismoID;
        private string _fechaSalidaVisita;
        private int _cedulaVisitante;
        private string _nombreVisitante;
        private string _telefonoVisitante;
        private int _personalID;
        private int _asuntoID;
        private string _fotoVisitante;
        private string _observacionVisita;
        private int _estatusVisitanteID;
        private int _seguridadUsuarioDatosID;
        private string _nombreOrganismo;
        public CAtencionVisita()
        {

        }
        public CAtencionVisita(int _visitaID, int _organismoID, string _fechaSalidaVisita, int _cedulaVisitante, string _nombreVisitante, string _telefonoVisitante, int _personalID, int _asuntoID, string _fotoVisitante, string _observacionVisita, int _estatusVisitanteID, int _seguridadUsuarioDatosID, string _nombreOrganismo)
        {
            this._visitaID = _visitaID;
            this._organismoID = _organismoID;
            this._fechaSalidaVisita = _fechaSalidaVisita;
            this._cedulaVisitante = _cedulaVisitante;
            this._nombreVisitante = _nombreVisitante;
            this._telefonoVisitante = _telefonoVisitante;
            this._personalID = _personalID;
            this._asuntoID = _asuntoID;
            this._fotoVisitante = _fotoVisitante;
            this._observacionVisita = _observacionVisita;
            this._estatusVisitanteID = _estatusVisitanteID;
            this._seguridadUsuarioDatosID = _seguridadUsuarioDatosID;
            this._nombreOrganismo = _nombreOrganismo;
        }

        public int VisitaID
        {
            get
            {
                return _visitaID;
            }

            set
            {
                _visitaID = value;
            }
        }
        public int OrganismoID
        {
            get
            {
                return _organismoID;
            }

            set
            {
                _organismoID = value;
            }
        }

        public string FechaSalidaVisita
        {
            get
            {
                return _fechaSalidaVisita;
            }

            set
            {
                _fechaSalidaVisita = value;
            }
        }

        public int CedulaVisitante
        {
            get
            {
                return _cedulaVisitante;
            }

            set
            {
                _cedulaVisitante = value;
            }
        }

        public string NombreVisitante
        {
            get
            {
                return _nombreVisitante;
            }

            set
            {
                _nombreVisitante = value;
            }
        }

        public string TelefonoVisitante
        {
            get
            {
                return _telefonoVisitante;
            }

            set
            {
                _telefonoVisitante = value;
            }
        }

        public int PersonalID
        {
            get
            {
                return _personalID;
            }

            set
            {
                _personalID = value;
            }
        }

        public int AsuntoID
        {
            get
            {
                return _asuntoID;
            }

            set
            {
                _asuntoID = value;
            }
        }

        public string FotoVisitante
        {
            get
            {
                return _fotoVisitante;
            }

            set
            {
                _fotoVisitante = value;
            }
        }

        public string ObservacionVisita
        {
            get
            {
                return _observacionVisita;
            }

            set
            {
                _observacionVisita = value;
            }
        }

        public int EstatusVisitanteID
        {
            get
            {
                return _estatusVisitanteID;
            }

            set
            {
                _estatusVisitanteID = value;
            }
        }
        public int SeguridadUsuarioDatosID
        {
            get
            {
                return _seguridadUsuarioDatosID;
            }

            set
            {
                _seguridadUsuarioDatosID = value;
            }
        }
        public string NombreOrganismo
        {
            get
            {
                return _nombreOrganismo;
            }

            set
            {
                _nombreOrganismo = value;
            }
        }


    }
}