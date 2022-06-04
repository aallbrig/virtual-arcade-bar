using Model.Interfaces;

namespace Model
{
    public class ServicePerson: ISummaryProvider
    {
        public static ServicePerson CreateInstance()
        {
            return new ServicePerson();
        }

        public string EntityType => "Service Person";

        public string EntityName => $"{this}";
    }
}
