using System;

namespace Model.Interfaces
{
    public interface IOpen
    {
        event Action Opened;
        void Open();
    }
}
