using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Xml.Serialization;

namespace ConsoleApp1
{
    [Serializable]
    public class MakakaMama
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public List<MakakaDeti> Deti = new List<MakakaDeti>();
        public MakakaMama()
        { }

        public MakakaMama(string name, int age)
        {
            Name = name;
            Age = age;
        }
    }
    [Serializable]
    public class MakakaDeti
    {
        public string Name { get; set; }
        public MakakaDeti()
        { }

        public MakakaDeti(string name) 
        {
            Name = name;
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            //MakakaMama mum = new MakakaMama("Lera", 59);
            //mum.Deti.Add(new MakakaDeti("Dimas"));
            //mum.Deti.Add(new MakakaDeti("Sasha"));
            XmlSerializer formatter = new XmlSerializer(typeof(MakakaMama));
            //using (FileStream fs = new FileStream("persons.xml", FileMode.OpenOrCreate))
            //{
            //    formatter.Serialize(fs, mum);
            //}
            using (FileStream fs = new FileStream("persons.xml", FileMode.OpenOrCreate))
            {
                MakakaMama newPerson = (MakakaMama)formatter.Deserialize(fs);
                Console.WriteLine($"Имя: {newPerson.Name} --- Возраст: {newPerson.Age}");
                foreach (var it in newPerson.Deti)
                    Console.WriteLine($"Имя: {it.Name}");
                Console.WriteLine("Объект десериализован");
            }
            Console.ReadKey();
        }
    }
}
