using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using demo.Models;
namespace demo.Controllers
{
    public class QuanLiChuyenBayController : Controller
    {
        // GET: QuanLiChuyenBay
        public ActionResult Index()
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            List<ChuyenBay> ketqua = conn.ChuyenBays.ToList(); 
            return View(ketqua);
        }

        // GET: QuanLiChuyenBay/Details/5
        public ActionResult Details(int MaChuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            ChuyenBay ketqua = conn.ChuyenBays.Find(MaChuyenBay);
             
            return View(ketqua);
        }



        // POST: QuanLiChuyenBay/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // GET: ChuyenBays/Create
        public ActionResult Create()
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            ViewBag.MaChangBay = new SelectList(conn.ChangBays, "MaChangBay", "SanBay_CatCanh");
            ViewBag.LoaiMayBay = new SelectList(conn.MayBays, "LoaiMayBay", "TenMayBay");
            return View();
        }

        // POST: ChuyenBays/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaChuyenBay,TGbay,NgayBay,GioBay,LoaiMayBay,Gia,SaleTreEm,SaleEmBe,MaChangBay")] ChuyenBay chuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            if (ModelState.IsValid)
            {

                conn.ChuyenBays.Add(chuyenBay);
                conn.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaChangBay = new SelectList(conn.ChangBays, "MaChangBay", "SanBay_CatCanh", chuyenBay.MaChangBay);
            ViewBag.LoaiMayBay = new SelectList(conn.MayBays, "LoaiMayBay", "TenMayBay", chuyenBay.LoaiMayBay);
            return View(chuyenBay);
        }

        // GET: QuanLiChuyenBay/Edit/5
        public ActionResult Edit(int MaChuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            ChuyenBay chuyenBay = conn.ChuyenBays.Find(MaChuyenBay);
            if (chuyenBay == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaChangBay = new SelectList(conn.ChangBays, "MaChangBay", "SanBay_CatCanh", chuyenBay.MaChangBay);
            ViewBag.LoaiMayBay = new SelectList(conn.MayBays, "LoaiMayBay", "TenMayBay", chuyenBay.LoaiMayBay);
            return View(chuyenBay);
        }

        // POST: QuanLiChuyenBay/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaChuyenBay,TGbay,NgayBay,GioBay,LoaiMayBay,Gia,SaleTreEm,SaleEmBe,MaChangBay")] ChuyenBay chuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            if (ModelState.IsValid)
            {
                conn.Entry(chuyenBay).State = EntityState.Modified;
                conn.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaChangBay = new SelectList(conn.ChangBays, "MaChangBay", "SanBay_CatCanh", chuyenBay.MaChangBay);
            ViewBag.LoaiMayBay = new SelectList(conn.MayBays, "LoaiMayBay", "TenMayBay", chuyenBay.LoaiMayBay);
            return View(chuyenBay);
        }


        // GET: ChuyenBays/Delete/5
        public ActionResult Delete(int MaChuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();
            if (MaChuyenBay <= 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChuyenBay chuyenBay = conn.ChuyenBays.Find(MaChuyenBay);
            if (chuyenBay == null)
            {
                return HttpNotFound();
            }
            return View(chuyenBay);
        }

        // POST: ChuyenBays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int MaChuyenBay)
        {
            DatVeMayBayEntities conn = new DatVeMayBayEntities();

            ChuyenBay chuyenBay = conn.ChuyenBays.Find(MaChuyenBay);
            conn.ChuyenBays.Remove(chuyenBay);
            conn.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
