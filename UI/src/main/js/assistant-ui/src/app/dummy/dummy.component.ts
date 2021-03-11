import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dummy',
  templateUrl: './dummy.component.html',
  styleUrls: ['./dummy.component.css']
})
export class DummyComponent implements OnInit {

  dummyValues = [1, 2, 3];
  
  constructor() { }

  ngOnInit(): void {
  }

}
