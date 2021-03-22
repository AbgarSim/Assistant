import { Component, OnInit } from '@angular/core';
import { DummyService } from '../services/dummy.service';
import { Dummy } from '../services/model/dummy.model';

@Component({
  selector: 'app-dummy',
  templateUrl: './dummy.component.html',
  styleUrls: ['./dummy.component.css']
})
export class DummyComponent implements OnInit {

  dummies: Dummy[];

  constructor(
    private dummyService: DummyService
  ) {
    this.dummyService.getDummyList().subscribe(
      response => {
        this.dummies = response;
      }
    )
   }

  ngOnInit(): void {
    
  }

  updateDummy(id: number, dummyToUpdate: Dummy){
    dummyToUpdate.num += 1;
    this.dummyService.updateDummy(id, dummyToUpdate).subscribe();
  }

}
