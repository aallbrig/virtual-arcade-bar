using Model.Interfaces;

namespace Model
{
    public class Patron: ISummaryProvider
    {
            public static Patron CreateInstance()
            {
                return new Patron();
            }

            public string EntityType => "Patron";

            public string EntityName => $"{this}";
    }
}
