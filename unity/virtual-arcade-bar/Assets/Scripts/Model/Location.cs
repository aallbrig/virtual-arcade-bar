using System;
using Model.Interfaces;

namespace Model
{
    public class Location: IOpen
    {
        public static Location CreateInstance()
        {
            return new Location();
        }

        public event Action Opened;

        public void Open() => Opened?.Invoke();
    }
}
